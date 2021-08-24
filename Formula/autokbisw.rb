class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for OSX"
  homepage "https://github.com/jeantil/autokbisw"
  url "https://github.com/jeantil/autokbisw/archive/1.2.0.tar.gz"
  version "1.2.0"
  sha256 "1c3bfad19b9025ad15f01ea0554351f47225807efd85cb4b4f0b6e1785af3f3e"

  bottle do
    root_url "https://github.com/terileptil/autokbisw/releases/download/1.2.0"
    sha256 cellar: "/opt/homebrew/Cellar",  arm64_big_sur: "5ff7e2ea7a0e3f4a4a03b3c4b8501c18776dc5d119ac036f6d655034149c1162"
    sha256 cellar: :any,                    high_sierra: "f46d97f6ddd99ad406ce1d990d89023bc7ab1f0a8246089e3d5cf7af1dbd8647"
    sha256                                  mojave: "f981e5f78c46ede1a9d814a79a812a16a6e2f7165e01db1cc6aacf943c5dce59"
  end

  depends_on xcode: ["12.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end

  test do
    system bin/"autokbisw", "--help"
  end
  
  def plist; <<~EOS
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/autokbisw</string>
      </array>
      <!--
      <string>--location</string>
      <string>-v</string>
      -->   
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
      <!--
      <key>StandardOutPath</key>
      <string>${var}/log/autokbisw.log</string>
      <key>StandardErrorPath</key>
      <string>${var}/log/autokbisw.log</string>
      -->
      <key>StandardErrorPath</key>
      <string>/dev/null</string>
      <key>StandardOutPath</key>
      <string>/dev/null</string>
    </dict>
  </plist>
  EOS
end

end
