### LaunchDarkly Sample tvOS Application ###

[![Build](https://github.com/launchdarkly/hello-tvos/actions/workflows/ci.yml/badge.svg)](https://github.com/launchdarkly/hello-tvos/actions/workflows/ci.yml)

We've built a simple tvOS app that demonstrates how LaunchDarkly's SDK works. Below, you'll find the basic build procedure, but for more comprehensive instructions, you can visit your [Quickstart page](https://app.launchdarkly.com/quickstart#/).

##### Build instructions #####

1. Make sure you have [XCode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12) installed
2. Make sure you have [Carthage](https://github.com/Carthage/Carthage) installed
3. Run `carthage update --platform tvOS --use-xcframeworks` to build XCFrameworks for the LaunchDarkly SDK
4. Open `hello-tvos.xcodeproj` in XCode
5. Copy the mobile key from your account settings page and the feature flag key from your LaunchDarkly dashboard into `AppDelegate.swift`
6. Run your application through XCode
