//
//  NoticeView.swift
//  ZooMate
//
//  Created by Song Kim on 5/28/25.
//

import SwiftUI

struct Notice: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let content: String
}

struct NoticeView: View {
    let notices: [Notice] = [
        Notice(
            title: "서비스 정기 점검 안내",
            date: "2025-06-01",
            content: "안정적인 서비스 제공을 위해 6월 3일(화) 오전 2시부터 5시까지 서버 점검이 예정되어 있습니다. 점검 시간 동안 앱 이용이 일시적으로 제한되며, 불편을 최소화할 수 있도록 최선을 다하겠습니다."
        ),
        Notice(
            title: "이용약관 및 개인정보 처리방침 개정 안내",
            date: "2025-05-25",
            content: "회원 여러분의 권리 보호 및 서비스 품질 향상을 위해 2025년 6월 1일부로 이용약관 및 개인정보 처리방침이 변경됩니다. 자세한 내용은 앱 내 '설정 > 약관 및 정책'에서 확인하실 수 있습니다."
        ),
        Notice(
            title: "앱 개선 및 문의하기 기능 오픈",
            date: "2025-05-20",
            content: "앱 사용 중 불편 사항이나 건의하고 싶은 점이 있으신가요? '설정 > 문의하기' 메뉴를 통해 언제든지 의견을 남겨주세요. 여러분의 피드백은 서비스 개선에 큰 도움이 됩니다!"
        ),
        Notice(
            title: "반려동물 매칭 시 유의사항 안내",
            date: "2025-05-10",
            content: "매칭 후 만남을 진행할 경우, 안전한 장소에서 반려동물의 건강상태 및 성격을 충분히 확인하시길 권장드립니다. 과도한 비용 요구, 허위 정보 등록 등은 앱 내 신고 기능을 통해 제보해주세요."
        )
    ]
    
    var body: some View {
        ZStack {
            Color.sandBeige.ignoresSafeArea() // 전체 배경을 파란색으로
            
            List(notices) { notice in
                VStack(alignment: .leading, spacing: 6) {
                    Text(notice.title)
                        .font(.headline)
                        .foregroundColor(.mainText)
                    Text(notice.date)
                        .font(.caption)
                        .foregroundColor(.mainText)
                    Text(notice.content)
                        .font(.body)
                        .foregroundColor(.mainText)
                        .lineLimit(5)
                }
                .padding(.vertical, 6)
                .listRowBackground(Color.background) // 셀 배경 투명하게
            }
            .scrollContentBackground(.hidden) // 리스트 기본 배경 제거
            .navigationTitle("공지사항")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NoticeView()
}
