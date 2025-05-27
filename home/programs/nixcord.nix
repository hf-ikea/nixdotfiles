{ flake, ... }: {
  imports = [
    flake.inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    discord.vencord.enable = false;
    vesktop.enable = true;
    vesktopConfig = {
      frameless = false;
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css"
      ];
      plugins = {
        alwaysExpandRoles.enable = true;
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
          method = "timestamp"; #0
        };
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterSessions = {
          enable = true;
          backgroundCheck = false;
        };
        betterSettings = {
          enable = true;
          disableFade = true;
          organizeMenu = true;
          eagerLoad = true;
        };
        biggerStreamPreview.enable = true;
        blurNSFW = {
          enable = true;
          blurAmount = 10;
        };
        callTimer = {
          enable = true;
          format = "stopwatch";
        };
        clearURLs.enable = true;
        consoleJanitor = {
          enable = true;
          disableLoggers = false;
          disableSpotifyLogger = true;
          whitelistedLoggers = "GatewaySocket, Routing/Utils";
        };
        copyEmojiMarkdown.enable = true;
        copyFileContents.enable = true;
        copyUserURLs.enable = true;
        crashHandler.enable = true;
        customRPC = {
          enable = true;
          type = 0;
        };
        dearrow = {
          enable = true;
          hideButton = false;
          replaceElements = 0;
          dearrowByDefault = false;
        };
        decor.enable = true;
        emoteCloner.enable = true;
        experiments = {
          enable = true;
          toolbarDevMenu = false;
        };
        fakeNitro = {
          enable = true;
          enableStickerBypass = true;
          enableStreamQualityBypass = true;
          enableEmojiBypass = true;
          transformEmojis = true;
          transformStickers = true;
          transformCompoundSentence = false;
        };
        favoriteGifSearch.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        gameActivityToggle = {
          enable = true;
          oldIcon = false;
        };
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        ignoreActivities = {
          enable = true;
          listMode = 0;
          idsList = ",";
          ignorePlaying = false;
          ignoreStreaming = false;
          ignoreListening = false;
          ignoreWatching = true;
          ignoreCompeting = true;
          ignoredActivities = [ ];
        };
        imageZoom = {
          enable = true;
          size = 110.89743589743588;
          zoom = 6.0256410256410255;
          saveZoomValues = true;
          nearestNeighbour = true;
          square = false;
          zoomSpeed = 0.1;
        };
        implicitRelationships = {
          enable = true;
          sortByAffinity = true;
        };
        loadingQuotes = {
          enable = true;
          replaceEvents = true;
          enableDiscordPresetQuotes = false;
          additionalQuotes = "";
          additionalQuotesDelimiter = "|";
          enablePluginPresetQuotes = true;
        };
        memberCount = {
          enable = true;
          memberList = true;
          toolTip = true;
        };
        messageLatency = {
          enable = true;
          latency = 1;
          detectDiscordKotlin = true;
          showMillis = true;
        };
        messageLogger = {
          enable = true;
          collapseDeleted = false;
          deleteStyle = "text";
          ignoreBots = false;
          ignoreSelf = false;
          ignoreUsers = "";
          ignoreChannels = "";
          ignoreGuilds = "";
          logEdits = true;
          logDeletes = true;
          inlineEdits = true;
        };
        moreCommands = {
          enable = false;
        };
        moreKaomoji.enable = true;
        moyai = {
          enable = true;
          ignoreBots = true;
          ignoreBlocked = true;
        };
        noMosaic = {
          enable = true;
          inlineVideo = true;
        };
        noOnboardingDelay.enable = true;
        noUnblockToJump.enable = true;
        normalizeMessageLinks.enable = true;
        petpet.enable = true;
        reactErrorDecoder.enable = true;
        relationshipNotifier = {
          enable = true;
          offlineRemovals = true;
          groups = true;
          servers = true;
          friends = true;
          friendRequestCancels = true;
        };
        replyTimestamp.enable = true;
        reverseImageSearch.enable = true;
        reviewDB = {
          enable = true;
          notifyReviews = true;
          showWarning = true;
          hideBlockedUsers = true;
          hideTimestamps = false;
        };
        secretRingToneEnabler = {
          enable = true;
          onlySnow = false;
        };
        serverInfo.enable = true;
        shikiCodeblocks = {
          enable = true;
          theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/2d87559c7601a928b9f7e0f0dda243d2fb6d4499/packages/tm-themes/themes/dark-plus.json";
          tryHljs = "SECONDARY";
          useDevIcon = "GREYSCALE";
          bgOpacity = 100;
        };
        showConnections = {
          enable = true;
          iconSpacing = 1;
          iconSize = 32;
        };
        showHiddenThings = {
          enable = true;
          showTimeouts = true;
          showInvitesPaused = true;
          showModView = true;
        };
        sortFriendRequests = {
          enable = true;
          showDates = false;
        };
        spotifyControls = {
          enable = true;
          hoverControls = false;
        };
        spotifyCrack = {
          enable = true;
          noSpotifyAutoPause = true;
          keepSpotifyActivityOnIdle = false;
        };
        stickerPaste.enable = true;
        typingIndicator = {
          enable = true;
          includeMutedChannels = false;
          includeCurrentChannel = true;
          indicatorMode = 3;
          includeBlockedUsers = false;
        };
        typingTweaks = {
          enable = true;
          alternativeFormatting = true;
          showRoleColors = true;
          showAvatars = true;
        };
        userMessagesPronouns = {
          enable = true;
          pronounsFormat = "LOWERCASE";
          showSelf = true;
        };
        validReply.enable = true;
        vencordToolbox.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster = {
          enable = true;
          multiplier = 2;
        };
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
        youtubeAdblock.enable = true;
        noTrack = {
          enable = true;
          disableAnalytics = true;
        };
        webContextMenus = {
          enable = true;
          addBack = true;
        };
        settings = {
          enable = true;
          settingsLocation = "aboveNitro";
        };
        supportHelper.enable = true;
        fullUserInChatbox.enable = true;
        badgeAPI.enable = true;
        HideMedia.enable = true;
        disableDeepLinks = {
          enable = true;
        };
      };
    };
  };
}
