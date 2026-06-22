cask "freeflow" do
    version "0.1.0"
    sha256 "8addae1306d18974608792ce476b935f4fcbf7a4014484b4022ea9e80360eab0"

    url "https://github.com/abgregs/free-flow/releases/download/v#{version}/FreeFlow-#{
  version}.dmg"
    name "Free Flow"
    desc "Menu bar dictation app with on-device transcription"
    homepage "https://github.com/abgregs/free-flow"
    
    depends_on macos: :sonoma   # macOS 14+
    depends_on arch: :arm64          # Apple Silicon

    app "FreeFlow.app"
    
    caveats <<~EOS
      Free Flow needs Microphone, Input Monitoring, and Accessibility permissions.
      On first launch, onboarding guides you through granting them in
      System Settings -> Privacy & Security.

      First launch downloads the speech model (~240 MB). Every launch and
      dictation after that is fully on-device.
    EOS
  
    zap trash: [
    "~/Library/Preferences/com.freeflow.app.plist",
    "~/Library/Application Support/FreeFlow"
    ]
  end