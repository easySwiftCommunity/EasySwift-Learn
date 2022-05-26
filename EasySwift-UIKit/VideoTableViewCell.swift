//
//  VideoTableViewCell.swift
//  Parallax
//
//  Created by Emil Shpeklord on 28.04.2022.

//

import UIKit
import SnapKit
import WebKit

class VideoTableViewCell: UITableViewCell {

    let identifier: String = "video"

    private var conteinerView: UIView = {
        let view = WKWebView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var videoImageView: WKWebView = {
        let view = WKWebView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpVideo()
        contentView.backgroundColor = .systemBackground

        contentView.addSubview(conteinerView)
        conteinerView.addSubview(videoImageView)

        conteinerView.snp.makeConstraints({ make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(20)
            make.height.equalTo(UIScreen.main.bounds.height * 0.238)
        })
        videoImageView.snp.makeConstraints({ make in
            make.left.right.equalToSuperview()
            make.bottom.top.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.238)
        })
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpVideo() {
        loadYoutube(videoID: "6rEl5S1e0gE")
        videoImageView.scrollView.isScrollEnabled = false
        func loadYoutube(videoID:String) {
            guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
            videoImageView.load( URLRequest(url: youtubeURL) )
        }
    }
}
