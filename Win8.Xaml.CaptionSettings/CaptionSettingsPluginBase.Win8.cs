﻿// <copyright file="CaptionSettingsPluginBase.Win8.cs" company="Michael S. Scherotter">
// Copyright (c) 2013 Michael S. Scherotter All Rights Reserved
// </copyright>
// <author>Michael S. Scherotter</author>
// <email>synergist@charette.com</email>
// <date>2013-11-23</date>
// <summary>CaptionSetting Plugin Base partial class for Windows 8.</summary>

namespace Microsoft.PlayerFramework.CaptionSettings
{
    using System.Linq;
    using Microsoft.PlayerFramework.CaptionSettings.Controls;
    using Microsoft.PlayerFramework.CaptionSettings.Model;
    using Windows.Foundation;
    using Windows.UI.ApplicationSettings;
    using Windows.UI.Core;
    using Windows.UI.Popups;
    using Windows.UI.Xaml;
    using Windows.UI.Xaml.Controls;
    using Windows.UI.Xaml.Controls.Primitives;
    using Windows.UI.Xaml.Media.Animation;

    /// <summary>
    /// Caption Settings Plugin Base partial class
    /// </summary>
    public partial class CaptionSettingsPluginBase
    {
        #region Fields
        /// <summary>
        /// the local settings key
        /// </summary>
        private const string LocalSettingsKey = "Microsoft.PlayerFramework.CaptionSettings";

        /// <summary>
        /// The Narrow settings pane width
        /// </summary>
        private const int NarrowWidth = 346;

        /// <summary>
        /// the settings popup control
        /// </summary>
        private Popup settingsPopup;

        /// <summary>
        /// The Full window bounds
        /// </summary>
        private Rect windowBounds;

        #endregion

        #region Constructors
        /// <summary>
        /// Initializes a new instance of the CaptionSettingsPluginBase class.
        /// </summary>
        protected CaptionSettingsPluginBase()
        {
            var loader = AssemblyResources.Get();

            this.SettingsCommandId = "CaptionSettings";

            this.Label = loader.GetString("CaptionSettings");
        }
        #endregion

        #region Properties
        /// <summary>
        /// Gets or sets the settings command Id for the Settings pane
        /// </summary>
        /// <remarks>default is "CaptionSettings"</remarks>
        public string SettingsCommandId { get; set; }

        /// <summary>
        /// Gets or sets the label for the settings pane
        /// </summary>
        /// <remarks>default is "Caption Settings"</remarks>
        public string Label { get; set; }

        /// <summary>
        /// Gets or sets the index of the settings command
        /// </summary>
        public int? SettingsCommandIndex { get; set; }
        #endregion

        #region Implementation

        /// <summary>
        /// Activate the plug-in
        /// </summary>
        internal void Activate()
        {
            SettingsPane.GetForCurrentView().CommandsRequested += this.CaptionsSettingsPlugin_CommandsRequested;

            object value;

            if (Windows.Storage.ApplicationData.Current.LocalSettings.Values.TryGetValue(LocalSettingsKey, out value))
            {
                var settingsString = value.ToString();

                this.Settings = CustomCaptionSettings.FromString(settingsString);

                this.IsDefault = false;
            }
            else
            {
                this.Settings = new CustomCaptionSettings();

                this.IsDefault = true;
            }

            this.Settings.PropertyChanged += this.Settings_PropertyChanged;
        }

        /// <summary>
        /// Deactivate the plug-in
        /// </summary>
        private void Deactivate()
        {
            SettingsPane.GetForCurrentView().CommandsRequested -= this.CaptionsSettingsPlugin_CommandsRequested;

            this.Settings.PropertyChanged -= this.Settings_PropertyChanged;
        }

        /// <summary>
        /// Save the settings
        /// </summary>
        private void Save()
        {
            if (this.IsDefault)
            {
                Windows.Storage.ApplicationData.Current.LocalSettings.Values.Remove(LocalSettingsKey);
            }
            else
            {
                Windows.Storage.ApplicationData.Current.LocalSettings.Values[LocalSettingsKey] = this.Settings.ToXmlString();
            }
        }

        /// <summary>
        /// Adds the caption settings command to the plug-in
        /// </summary>
        /// <param name="sender">the settings pane</param>
        /// <param name="args">the settings pane commands requested event arguments</param>
        private void CaptionsSettingsPlugin_CommandsRequested(SettingsPane sender, SettingsPaneCommandsRequestedEventArgs args)
        {
            System.Diagnostics.Debug.Assert(this.MediaPlayer != null, "MediaPlayer is null.");

            System.Diagnostics.Debug.Assert(!string.IsNullOrWhiteSpace(this.Label), "Label is null.");

            System.Diagnostics.Debug.Assert(!string.IsNullOrWhiteSpace(this.SettingsCommandId), "SettingsCommandId is null.");

            if (this.MediaPlayer == null)
            {
                return;
            }

            var command = (from item in args.Request.ApplicationCommands
                           where item.Id.ToString() == this.SettingsCommandId
                           select item).FirstOrDefault();

            if (command == null)
            {
                // the command isn't already in the list
                command = new SettingsCommand(
                    this.SettingsCommandId,
                    this.Label,
                    new Windows.UI.Popups.UICommandInvokedHandler(this.OnShowCaptionSettings));

                if (this.SettingsCommandIndex.HasValue)
                {
                    args.Request.ApplicationCommands.Insert(this.SettingsCommandIndex.Value, command);
                }
                else
                {
                    args.Request.ApplicationCommands.Add(command);
                }
            }
            else
            {
                // the command is in the list so only hook up the Invoked handler
                command.Invoked += this.OnShowCaptionSettings;
            }
        }

        /// <summary>
        /// Show the caption settings
        /// </summary>
        /// <param name="command">the command</param>
        private void OnShowCaptionSettings(IUICommand command)
        {
            if (this.OnLoadCaptionSettings != null)
            {
                this.OnLoadCaptionSettings(this, new CustomCaptionSettingsEventArgs(this.Settings));
            }

            this.windowBounds = Window.Current.Bounds;

            var transitions = new TransitionCollection();
            transitions.Add(new EntranceThemeTransition());

            Window.Current.Activated += this.Current_Activated;

            var control = new CaptionSettingsControl
            {
                CaptionSettings = this.Settings,
                IsDefault = this.IsDefault,
            };

            control.IsDefaultChanged += delegate(object sender, System.EventArgs e)
            {
                this.IsDefault = control.IsDefault;
            };

            var settingsControl = new SettingsControl
            {
                Style = this.Style,
                Label = this.Label,
                Content = control,
                Width = NarrowWidth,
                Height = this.windowBounds.Height
            };

            this.settingsPopup = new Popup
            {
                Child = settingsControl,
                Transitions = transitions,
                IsLightDismissEnabled = true,
                Width = NarrowWidth,
                Height = this.windowBounds.Height,
            };

            this.settingsPopup.Closed += this.OnPopupClosed;
            this.settingsPopup.SetValue(Canvas.LeftProperty, this.windowBounds.Width - NarrowWidth);
            this.settingsPopup.SetValue(Canvas.TopProperty, 0);

            this.settingsPopup.IsOpen = true;
        }

        /// <summary>
        /// Apply the caption settings when the properties change
        /// </summary>
        /// <param name="sender">the settings</param>
        /// <param name="e">the property changed event arguments</param>
        private void Settings_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            this.ApplyCaptionSettings(this.Settings);
        }

        /// <summary>
        /// Show ads when the popup closes
        /// </summary>
        /// <param name="sender">the sender</param>
        /// <param name="e">the event arguments</param>
        private void OnPopupClosed(object sender, object e)
        {
            Window.Current.Activated -= this.Current_Activated;
        }

        /// <summary>
        /// Close the settings popup when the window is deactivated
        /// </summary>
        /// <param name="sender">the page</param>
        /// <param name="e">the window activated event arguments</param>
        private void Current_Activated(object sender, WindowActivatedEventArgs e)
        {
            if (e.WindowActivationState == CoreWindowActivationState.Deactivated)
            {
                this.settingsPopup.IsOpen = false;
            }
        }
        #endregion
    }
}