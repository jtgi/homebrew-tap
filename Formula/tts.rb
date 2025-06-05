class Tts < Formula
  desc "Text-to-speech CLI using ElevenLabs API"
  homepage "https://github.com/jtgi/tts"
  url "https://github.com/jtgi/tts/archive/refs/tags/0.0.1.tar.gz"
  sha256 "6911dca2140289285b1c42fa3f609cef7daa9523390f22bc469bffa5635f5781"
  license "MIT"

  def install
    bin.install "tts"
    man1.install "man/tts.1"
    bash_completion.install "completions/tts.bash" => "tts"
    zsh_completion.install "completions/tts.zsh" => "_tts"
  end

  def caveats
    <<~EOS
      To use tts, you need to set your ElevenLabs API key:
        export ELEVENLABS_API_KEY='your-api-key-here'

      Usage:
        echo "Hello world" | tts > hello.mp3
        cat book.txt | tts -v EXAVITQu4vr4xnSDxMaL > book.mp3
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/tts --help", 0)
  end
end
