import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    private var keepScreenOnSwitch: UISwitch!
    private var backgroundModeSwitch: UISwitch!
    private var launchTikTokButton: UIButton!
    private var statusLabel: UILabel!
    private var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PlaystorePlugins"
        view.backgroundColor = .white
        
        setupUI()
        setupAudioSession()
    }
    
    private func setupUI() {
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "PlaystorePlugins"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Subtitle Label
        let subtitleLabel = UILabel()
        subtitleLabel.text = "TikTok Continuous Playback"
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.textColor = .gray
        subtitleLabel.textAlignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
        
        // Card View
        let cardView = UIView()
        cardView.backgroundColor = .systemGray6
        cardView.layer.cornerRadius = 12
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        
        // Keep Screen On
        let screenOnLabel = UILabel()
        screenOnLabel.text = "Keep Screen On"
        screenOnLabel.font = UIFont.systemFont(ofSize: 16)
        screenOnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        keepScreenOnSwitch = UISwitch()
        keepScreenOnSwitch.addTarget(self, action: #selector(keepScreenOnToggled), for: .valueChanged)
        keepScreenOnSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        let screenOnStack = UIStackView(arrangedSubviews: [screenOnLabel, keepScreenOnSwitch])
        screenOnStack.axis = .horizontal
        screenOnStack.distribution = .equalSpacing
        screenOnStack.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(screenOnStack)
        
        // Background Mode
        let backgroundLabel = UILabel()
        backgroundLabel.text = "Background Mode"
        backgroundLabel.font = UIFont.systemFont(ofSize: 16)
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundModeSwitch = UISwitch()
        backgroundModeSwitch.addTarget(self, action: #selector(backgroundModeToggled), for: .valueChanged)
        backgroundModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundStack = UIStackView(arrangedSubviews: [backgroundLabel, backgroundModeSwitch])
        backgroundStack.axis = .horizontal
        backgroundStack.distribution = .equalSpacing
        backgroundStack.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(backgroundStack)
        
        // Launch TikTok Button
        launchTikTokButton = UIButton(type: .system)
        launchTikTokButton.setTitle("Launch TikTok", for: .normal)
        launchTikTokButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        launchTikTokButton.backgroundColor = .black
        launchTikTokButton.setTitleColor(.white, for: .normal)
        launchTikTokButton.layer.cornerRadius = 8
        launchTikTokButton.addTarget(self, action: #selector(launchTikTok), for: .touchUpInside)
        launchTikTokButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(launchTikTokButton)
        
        // Status Label
        statusLabel = UILabel()
        statusLabel.text = "Ready"
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.textAlignment = .center
        statusLabel.backgroundColor = .systemGray6
        statusLabel.layer.cornerRadius = 8
        statusLabel.clipsToBounds = true
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusLabel)
        
        // Contact Label
        let contactLabel = UILabel()
        contactLabel.text = "Contact: playstoreplugins@gmail.com"
        contactLabel.font = UIFont.systemFont(ofSize: 12)
        contactLabel.textColor = .lightGray
        contactLabel.textAlignment = .center
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            cardView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 32),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            cardView.heightAnchor.constraint(equalToConstant: 120),
            
            screenOnStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            screenOnStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            screenOnStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            backgroundStack.topAnchor.constraint(equalTo: screenOnStack.bottomAnchor, constant: 24),
            backgroundStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            backgroundStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            launchTikTokButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 24),
            launchTikTokButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            launchTikTokButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            launchTikTokButton.heightAnchor.constraint(equalToConstant: 56),
            
            statusLabel.topAnchor.constraint(equalTo: launchTikTokButton.bottomAnchor, constant: 24),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            statusLabel.heightAnchor.constraint(equalToConstant: 60),
            
            contactLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            contactLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            contactLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
    }
    
    @objc private func keepScreenOnToggled() {
        UIApplication.shared.isIdleTimerDisabled = keepScreenOnSwitch.isOn
        updateStatus(keepScreenOnSwitch.isOn ? "Screen will stay on" : "Screen timeout enabled")
    }
    
    @objc private func backgroundModeToggled() {
        if backgroundModeSwitch.isOn {
            startSilentAudio()
            updateStatus("Background mode enabled")
        } else {
            stopSilentAudio()
            updateStatus("Background mode disabled")
        }
    }
    
    @objc private func launchTikTok() {
        let tiktokURL = URL(string: "tiktok://")!
        let appStoreURL = URL(string: "https://apps.apple.com/app/tiktok/id835599320")!
        
        if UIApplication.shared.canOpenURL(tiktokURL) {
            UIApplication.shared.open(tiktokURL)
            updateStatus("Launching TikTok...")
        } else {
            UIApplication.shared.open(appStoreURL)
            updateStatus("Opening App Store...")
        }
    }
    
    private func startSilentAudio() {
        // Play silent audio to keep app alive in background
        guard let url = Bundle.main.url(forResource: "silence", withExtension: "mp3") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.volume = 0.01
            audioPlayer?.play()
        } catch {
            print("Failed to play silent audio: \(error)")
        }
    }
    
    private func stopSilentAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    private func updateStatus(_ message: String) {
        statusLabel.text = message
    }
}
