//
//  ProvinceEnum.swift
//  SVGMapSample
//
//  Created by 김호성 on 2024.10.23.
//

import Foundation

protocol ProvinceType {
    var title: String { get }
}

enum MapEnum: String, CaseIterable {
    case world
    case korea
    
    var provinceEnum: ProvinceType.Type {
        switch self {
        case .world: return WorldProvinceEnum.self
        case .korea: return SouthKoreaProvinceEnum.self
        }
    }
    var svgFileName: String {
        switch self {
        case .world: return "world.svg"
        case .korea: return "korea.svg"
        }
    }
}

enum WorldProvinceEnum: String, CaseIterable {
    case andorra
}
extension WorldProvinceEnum: ProvinceType {
    var title: String {
        return ""
    }
}

enum SouthKoreaProvinceEnum: String, CaseIterable {
    
    // Seoul
    case seoul_jongno_gu
    case seoul_jung_gu
    case seoul_yongsan_gu
    case seoul_seongdong_gu
    case seoul_gwangjin_gu
    case seoul_dongdaemun_gu
    case seoul_jungnang_gu
    case seoul_seongbuk_gu
    case seoul_gangbuk_gu
    case seoul_dobong_gu
    case seoul_nowon_gu
    case seoul_eunpyeong_gu
    case seoul_seodaemun_gu
    case seoul_mapo_gu
    case seoul_yangcheon_gu
    case seoul_gangseo_gu
    case seoul_guro_gu
    case seoul_geumcheon_gu
    case seoul_yeongdeungpo_gu
    case seoul_dongjak_gu
    case seoul_gwanak_gu
    case seoul_seocho_gu
    case seoul_gangnam_gu
    case seoul_songpa_gu
    case seoul_gangdong_gu
    
    // Busan
    case busan_jung_gu
    case busan_seo_gu
    case busan_dong_gu
    case busan_yeongdo_gu
    case busan_busanjin_gu
    case busan_dongnae_gu
    case busan_nam_gu
    case busan_buk_gu
    case busan_haeundae_gu
    case busan_saha_gu
    case busan_geumjeong_gu
    case busan_gangseo_gu
    case busan_yeonje_gu
    case busan_suyeong_gu
    case busan_sasang_gu
    case busan_gijang_gun
    
    // Daegu
    case daegu_jung_gu
    case daegu_dong_gu
    case daegu_seo_gu
    case daegu_nam_gu
    case daegu_buk_gu
    case daegu_suseong_gu
    case daegu_dalseo_gu
    case daegu_dalseong_gun
    case daegu_gunwi_gun
    
    // Incheon
    case incheon_jung_gu
    case incheon_dong_gu
    case incheon_michuhol_gu
    case incheon_yeonsu_gu
    case incheon_namdong_gu
    case incheon_bupyeong_gu
    case incheon_gyeyang_gu
    case incheon_seogu
    case incheon_ganghwa_gun
    case incheon_ongjin_gun
    
    // Gwangju
    case gwangju_dong_gu
    case gwangju_seo_gu
    case gwangju_nam_gu
    case gwangju_buk_gu
    case gwangju_gwangsan_gu
    
    // Daejeon
    case daejeon_dong_gu
    case daejeon_jung_gu
    case daejeon_seo_gu
    case daejeon_yuseong_gu
    case daejeon_daedeok_gu
    
    // Ulsan
    case ulsan_jung_gu
    case ulsan_nam_gu
    case ulsan_dong_gu
    case ulsan_buk_gu
    case ulsan_ulju_gun
    
    // Sejong
    case sejong_si
    
    // Gyeonggi-do
    case gyeonggi_do_suwon_si_jangan_gu
    case gyeonggi_do_suwon_si_gwonseon_gu
    case gyeonggi_do_suwon_si_paldal_gu
    case gyeonggi_do_suwon_si_yeongtong_gu
    case gyeonggi_do_seongnam_si_sujeong_gu
    case gyeonggi_do_seongnam_si_jungwon_gu
    case gyeonggi_do_seongnam_si_bundang_gu
    case gyeonggi_do_uijeongbu_si
    case gyeonggi_do_anyang_si_manan_gu
    case gyeonggi_do_anyang_si_dongan_gu
    case gyeonggi_do_bucheon_si_wonmi_gu
    case gyeonggi_do_bucheon_si_sosa_gu
    case gyeonggi_do_bucheon_si_ojeong_gu
    case gyeonggi_do_gwangmyeong_si
    case gyeonggi_do_pyeongtaek_si
    case gyeonggi_do_dongducheon_si
    case gyeonggi_do_ansan_si_sangnok_gu
    case gyeonggi_do_ansan_si_danwon_gu
    case gyeonggi_do_goyang_si_deogyang_gu
    case gyeonggi_do_goyang_si_ilsandong_gu
    case gyeonggi_do_goyang_si_ilsanseo_gu
    case gyeonggi_do_gwacheon_si
    case gyeonggi_do_guri_si
    case gyeonggi_do_namyangju_si
    case gyeonggi_do_osan_si
    case gyeonggi_do_siheung_si
    case gyeonggi_do_gunpo_si
    case gyeonggi_do_uiwang_si
    case gyeonggi_do_hanam_si
    case gyeonggi_do_yongin_si_cheoin_gu
    case gyeonggi_do_yongin_si_giheung_gu
    case gyeonggi_do_yongin_si_suji_gu
    case gyeonggi_do_paju_si
    case gyeonggi_do_icheon_si
    case gyeonggi_do_anseong_si
    case gyeonggi_do_gimpo_si
    case gyeonggi_do_hwaseong_si
    case gyeonggi_do_gwanju_si
    case gyeonggi_do_yangju_si
    case gyeonggi_do_pocheon_si
    case gyeonggi_do_yeoju_si
    case gyeonggi_do_yeoncheon_gun
    case gyeonggi_do_gapyeong_gun
    case gyeonggi_do_yangpyeong_gun
    
    // Chungcheongbuk-do
    case chungcheongbuk_do_cheongju_si_sangdang_gu
    case chungcheongbuk_do_cheongju_si_seowon_gu
    case chungcheongbuk_do_cheongju_si_heungdeok_gu
    case chungcheongbuk_do_cheongju_si_cheongwon_gu
    case chungcheongbuk_do_chungju_si
    case chungcheongbuk_do_jecheon_si
    case chungcheongbuk_do_boeun_gun
    case chungcheongbuk_do_okcheon_gun
    case chungcheongbuk_do_yeongdong_gun
    case chungcheongbuk_do_jeungpyeong_gun
    case chungcheongbuk_do_jincheon_gun
    case chungcheongbuk_do_goesan_gun
    case chungcheongbuk_do_eumseong_gun
    case chungcheongbuk_do_danyang_gun
    
    // Chungcheongnam-do
    case chungcheongnam_do_cheonan_si_dongnam_gu
    case chungcheongnam_do_cheonan_si_seobuk_gu
    case chungcheongnam_do_gongju_si
    case chungcheongnam_do_boryeong_si
    case chungcheongnam_do_asan_si
    case chungcheongnam_do_seosan_si
    case chungcheongnam_do_nonsan_si
    case chungcheongnam_do_gyeryong_si
    case chungcheongnam_do_dangjin_si
    case chungcheongnam_do_geumsan_gun
    case chungcheongnam_do_buyeo_gun
    case chungcheongnam_do_seocheon_gun
    case chungcheongnam_do_cheongyang_gun
    case chungcheongnam_do_hongseong_gun
    case chungcheongnam_do_yesan_gun
    case chungcheongnam_do_taean_gun
    
    // Jeollanam-do
    case jeollanam_do_mokpo_si
    case jeollanam_do_yeosu_si
    case jeollanam_do_suncheon_si
    case jeollanam_do_naju_si
    case jeollanam_do_gwangyang_si
    case jeollanam_do_damyang_gun
    case jeollanam_do_gokseong_gun
    case jeollanam_do_gurye_gun
    case jeollanam_do_goheung_gun
    case jeollanam_do_boseong_gun
    case jeollanam_do_hwasun_gun
    case jeollanam_do_jangheung_gun
    case jeollanam_do_gangjin_gun
    case jeollanam_do_haenam_gun
    case jeollanam_do_yeongam_gun
    case jeollanam_do_muan_gun
    case jeollanam_do_hampyeong_gun
    case jeollanam_do_yeonggwang_gun
    case jeollanam_do_jangseong_gun
    case jeollanam_do_wando_gun
    case jeollanam_do_jindo_gun
    case jeollanam_do_sinan_gun
    
    // Gyeongsangbuk-do
    case gyeongsangbuk_do_pohang_si_nam_gu
    case gyeongsangbuk_do_pohang_si_buk_gu
    case gyeongsangbuk_do_gyeongju_si
    case gyeongsangbuk_do_gimcheon_si
    case gyeongsangbuk_do_andong_si
    case gyeongsangbuk_do_gumi_si
    case gyeongsangbuk_do_yeongju_si
    case gyeongsangbuk_do_yeongcheon_si
    case gyeongsangbuk_do_sangju_si
    case gyeongsangbuk_do_mungyeong_si
    case gyeongsangbuk_do_gyeongsan_si
    case gyeongsangbuk_do_uiseong_gun
    case gyeongsangbuk_do_cheongsong_gun
    case gyeongsangbuk_do_yeongyang_gun
    case gyeongsangbuk_do_yeongdeok_gun
    case gyeongsangbuk_do_cheongdo_gun
    case gyeongsangbuk_do_goryeong_gun
    case gyeongsangbuk_do_seongju_gun
    case gyeongsangbuk_do_chilgok_gun
    case gyeongsangbuk_do_yecheon_gun
    case gyeongsangbuk_do_bonghwa_gun
    case gyeongsangbuk_do_uljin_gun
    case gyeongsangbuk_do_ulleung_gun
    
    // Gyeongsangnam-do
    case gyeongsangnam_do_changwon_si_uichang_gu
    case gyeongsangnam_do_changwon_si_seongsan_gu
    case gyeongsangnam_do_changwon_si_masanhappo_gu
    case gyeongsangnam_do_changwon_si_masanhoewon_gu
    case gyeongsangnam_do_changwon_si_jinhae_gu
    case gyeongsangnam_do_jinju_si
    case gyeongsangnam_do_tongyeong_si
    case gyeongsangnam_do_sacheon_si
    case gyeongsangnam_do_gimhae_si
    case gyeongsangnam_do_miryang_si
    case gyeongsangnam_do_geoje_si
    case gyeongsangnam_do_yangsan_si
    case gyeongsangnam_do_uiryeong_gun
    case gyeongsangnam_do_haman_gun
    case gyeongsangnam_do_changnyeong_gun
    case gyeongsangnam_do_goseong_gun
    case gyeongsangnam_do_namhae_gun
    case gyeongsangnam_do_hadong_gun
    case gyeongsangnam_do_sancheong_gun
    case gyeongsangnam_do_hamyang_gun
    case gyeongsangnam_do_geochang_gun
    case gyeongsangnam_do_hapcheon_gun
    
    // Jeju-do
    case jeju_do_jeju_si
    case jeju_do_seogwipo_si
    
    // Gangwon-do
    case gangwon_do_chuncheon_si
    case gangwon_do_wonju_si
    case gangwon_do_gangneung_si
    case gangwon_do_donghae_si
    case gangwon_do_taebaek_si
    case gangwon_do_sokcho_si
    case gangwon_do_samcheok_si
    case gangwon_do_hongcheon_gun
    case gangwon_do_hoengseong_gun
    case gangwon_do_yeongwol_gun
    case gangwon_do_pyeongchang_gun
    case gangwon_do_jeongseon_gun
    case gangwon_do_cheorwon_gun
    case gangwon_do_hwacheon_gun
    case gangwon_do_yanggu_gun
    case gangwon_do_inje_gun
    case gangwon_do_goseong_gun
    case gangwon_do_yangyang_gun
    
    // Jeonbuk-do
    case jeonbuk_do_jeonju_si_wansan_gu
    case jeonbuk_do_jeonju_si_deokjin_gu
    case jeonbuk_do_gunsan_si
    case jeonbuk_do_iksan_si
    case jeonbuk_do_jeongeup_si
    case jeonbuk_do_namwon_si
    case jeonbuk_do_gimje_si
    case jeonbuk_do_wanju_gun
    case jeonbuk_do_jinan_gun
    case jeonbuk_do_muju_gun
    case jeonbuk_do_jangsu_gun
    case jeonbuk_do_imsil_gun
    case jeonbuk_do_sunchang_gun
    case jeonbuk_do_gochang_gun
    case jeonbuk_do_buan_gun
}

extension SouthKoreaProvinceEnum: ProvinceType {
    var title: String {
        switch self {
        case .seoul_jongno_gu: return "서울특별시 종로구"
        case .seoul_jung_gu: return "서울특별시 중구"
        case .seoul_yongsan_gu: return "서울특별시 용산구"
        case .seoul_seongdong_gu: return "서울특별시 성동구"
        case .seoul_gwangjin_gu: return "서울특별시 광진구"
        case .seoul_dongdaemun_gu: return "서울특별시 동대문구"
        case .seoul_jungnang_gu: return "서울특별시 중랑구"
        case .seoul_seongbuk_gu: return "서울특별시 성북구"
        case .seoul_gangbuk_gu: return "서울특별시 강북구"
        case .seoul_dobong_gu: return "서울특별시 도봉구"
        case .seoul_nowon_gu: return "서울특별시 노원구"
        case .seoul_eunpyeong_gu: return "서울특별시 은평구"
        case .seoul_seodaemun_gu: return "서울특별시 서대문구"
        case .seoul_mapo_gu: return "서울특별시 마포구"
        case .seoul_yangcheon_gu: return "서울특별시 양천구"
        case .seoul_gangseo_gu: return "서울특별시 강서구"
        case .seoul_guro_gu: return "서울특별시 구로구"
        case .seoul_geumcheon_gu: return "서울특별시 금천구"
        case .seoul_yeongdeungpo_gu: return "서울특별시 영등포구"
        case .seoul_dongjak_gu: return "서울특별시 동작구"
        case .seoul_gwanak_gu: return "서울특별시 관악구"
        case .seoul_seocho_gu: return "서울특별시 서초구"
        case .seoul_gangnam_gu: return "서울특별시 강남구"
        case .seoul_songpa_gu: return "서울특별시 송파구"
        case .seoul_gangdong_gu: return "서울특별시 강동구"
        case .busan_jung_gu: return "부산광역시 중구"
        case .busan_seo_gu: return "부산광역시 서구"
        case .busan_dong_gu: return "부산광역시 동구"
        case .busan_yeongdo_gu: return "부산광역시 영도구"
        case .busan_busanjin_gu: return "부산광역시 부산진구"
        case .busan_dongnae_gu: return "부산광역시 동래구"
        case .busan_nam_gu: return "부산광역시 남구"
        case .busan_buk_gu: return "부산광역시 북구"
        case .busan_haeundae_gu: return "부산광역시 해운대구"
        case .busan_saha_gu: return "부산광역시 사하구"
        case .busan_geumjeong_gu: return "부산광역시 금정구"
        case .busan_gangseo_gu: return "부산광역시 강서구"
        case .busan_yeonje_gu: return "부산광역시 연제구"
        case .busan_suyeong_gu: return "부산광역시 수영구"
        case .busan_sasang_gu: return "부산광역시 사상구"
        case .busan_gijang_gun: return "부산광역시 기장군"
        case .daegu_jung_gu: return "대구광역시 중구"
        case .daegu_dong_gu: return "대구광역시 동구"
        case .daegu_seo_gu: return "대구광역시 서구"
        case .daegu_nam_gu: return "대구광역시 남구"
        case .daegu_buk_gu: return "대구광역시 북구"
        case .daegu_suseong_gu: return "대구광역시 수성구"
        case .daegu_dalseo_gu: return "대구광역시 달서구"
        case .daegu_dalseong_gun: return "대구광역시 달성군"
        case .daegu_gunwi_gun: return "대구광역시 군위군"
        case .incheon_jung_gu: return "인천광역시 중구"
        case .incheon_dong_gu: return "인천광역시 동구"
        case .incheon_michuhol_gu: return "인천광역시 미추홀구"
        case .incheon_yeonsu_gu: return "인천광역시 연수구"
        case .incheon_namdong_gu: return "인천광역시 남동구"
        case .incheon_bupyeong_gu: return "인천광역시 부평구"
        case .incheon_gyeyang_gu: return "인천광역시 계양구"
        case .incheon_seogu: return "인천광역시 서구"
        case .incheon_ganghwa_gun: return "인천광역시 강화군"
        case .incheon_ongjin_gun: return "인천광역시 옹진군"
        case .gwangju_dong_gu: return "광주광역시 동구"
        case .gwangju_seo_gu: return "광주광역시 서구"
        case .gwangju_nam_gu: return "광주광역시 남구"
        case .gwangju_buk_gu: return "광주광역시 북구"
        case .gwangju_gwangsan_gu: return "광주광역시 광산구"
        case .daejeon_dong_gu: return "대전광역시 동구"
        case .daejeon_jung_gu: return "대전광역시 중구"
        case .daejeon_seo_gu: return "대전광역시 서구"
        case .daejeon_yuseong_gu: return "대전광역시 유성구"
        case .daejeon_daedeok_gu: return "대전광역시 대덕구"
        case .ulsan_jung_gu: return "울산광역시 중구"
        case .ulsan_nam_gu: return "울산광역시 남구"
        case .ulsan_dong_gu: return "울산광역시 동구"
        case .ulsan_buk_gu: return "울산광역시 북구"
        case .ulsan_ulju_gun: return "울산광역시 울주군"
        case .sejong_si: return "세종특별자치시"
        case .gyeonggi_do_suwon_si_jangan_gu: return "경기도 수원시 장안구"
        case .gyeonggi_do_suwon_si_gwonseon_gu: return "경기도 수원시 권선구"
        case .gyeonggi_do_suwon_si_paldal_gu: return "경기도 수원시 팔달구"
        case .gyeonggi_do_suwon_si_yeongtong_gu: return "경기도 수원시 영통구"
        case .gyeonggi_do_seongnam_si_sujeong_gu: return "경기도 성남시 수정구"
        case .gyeonggi_do_seongnam_si_jungwon_gu: return "경기도 성남시 중원구"
        case .gyeonggi_do_seongnam_si_bundang_gu: return "경기도 성남시 분당구"
        case .gyeonggi_do_uijeongbu_si: return "경기도 의정부시"
        case .gyeonggi_do_anyang_si_manan_gu: return "경기도 안양시 만안구"
        case .gyeonggi_do_anyang_si_dongan_gu: return "경기도 안양시 동안구"
        case .gyeonggi_do_bucheon_si_wonmi_gu: return "경기도 부천시 원미구"
        case .gyeonggi_do_bucheon_si_sosa_gu: return "경기도 부천시 소사구"
        case .gyeonggi_do_bucheon_si_ojeong_gu: return "경기도 부천시 오정구"
        case .gyeonggi_do_gwangmyeong_si: return "경기도 광명시"
        case .gyeonggi_do_pyeongtaek_si: return "경기도 평택시"
        case .gyeonggi_do_dongducheon_si: return "경기도 동두천시"
        case .gyeonggi_do_ansan_si_sangnok_gu: return "경기도 안산시 상록구"
        case .gyeonggi_do_ansan_si_danwon_gu: return "경기도 안산시 단원구"
        case .gyeonggi_do_goyang_si_deogyang_gu: return "경기도 고양시 덕양구"
        case .gyeonggi_do_goyang_si_ilsandong_gu: return "경기도 고양시 일산동구"
        case .gyeonggi_do_goyang_si_ilsanseo_gu: return "경기도 고양시 일산서구"
        case .gyeonggi_do_gwacheon_si: return "경기도 과천시"
        case .gyeonggi_do_guri_si: return "경기도 구리시"
        case .gyeonggi_do_namyangju_si: return "경기도 남양주시"
        case .gyeonggi_do_osan_si: return "경기도 오산시"
        case .gyeonggi_do_siheung_si: return "경기도 시흥시"
        case .gyeonggi_do_gunpo_si: return "경기도 군포시"
        case .gyeonggi_do_uiwang_si: return "경기도 의왕시"
        case .gyeonggi_do_hanam_si: return "경기도 하남시"
        case .gyeonggi_do_yongin_si_cheoin_gu: return "경기도 용인시 처인구"
        case .gyeonggi_do_yongin_si_giheung_gu: return "경기도 용인시 기흥구"
        case .gyeonggi_do_yongin_si_suji_gu: return "경기도 용인시 수지구"
        case .gyeonggi_do_paju_si: return "경기도 파주시"
        case .gyeonggi_do_icheon_si: return "경기도 이천시"
        case .gyeonggi_do_anseong_si: return "경기도 안성시"
        case .gyeonggi_do_gimpo_si: return "경기도 김포시"
        case .gyeonggi_do_hwaseong_si: return "경기도 화성시"
        case .gyeonggi_do_gwanju_si: return "경기도 광주시"
        case .gyeonggi_do_yangju_si: return "경기도 양주시"
        case .gyeonggi_do_pocheon_si: return "경기도 포천시"
        case .gyeonggi_do_yeoju_si: return "경기도 여주시"
        case .gyeonggi_do_yeoncheon_gun: return "경기도 연천군"
        case .gyeonggi_do_gapyeong_gun: return "경기도 가평군"
        case .gyeonggi_do_yangpyeong_gun: return "경기도 양평군"
        case .chungcheongbuk_do_cheongju_si_sangdang_gu: return "충청북도 청주시 상당구"
        case .chungcheongbuk_do_cheongju_si_seowon_gu: return "충청북도 청주시 서원구"
        case .chungcheongbuk_do_cheongju_si_heungdeok_gu: return "충청북도 청주시 흥덕구"
        case .chungcheongbuk_do_cheongju_si_cheongwon_gu: return "충청북도 청주시 청원구"
        case .chungcheongbuk_do_chungju_si: return "충청북도 충주시"
        case .chungcheongbuk_do_jecheon_si: return "충청북도 제천시"
        case .chungcheongbuk_do_boeun_gun: return "충청북도 보은군"
        case .chungcheongbuk_do_okcheon_gun: return "충청북도 옥천군"
        case .chungcheongbuk_do_yeongdong_gun: return "충청북도 영동군"
        case .chungcheongbuk_do_jeungpyeong_gun: return "충청북도 증평군"
        case .chungcheongbuk_do_jincheon_gun: return "충청북도 진천군"
        case .chungcheongbuk_do_goesan_gun: return "충청북도 괴산군"
        case .chungcheongbuk_do_eumseong_gun: return "충청북도 음성군"
        case .chungcheongbuk_do_danyang_gun: return "충청북도 단양군"
        case .chungcheongnam_do_cheonan_si_dongnam_gu: return "충청남도 천안시 동남구"
        case .chungcheongnam_do_cheonan_si_seobuk_gu: return "충청남도 천안시 서북구"
        case .chungcheongnam_do_gongju_si: return "충청남도 공주시"
        case .chungcheongnam_do_boryeong_si: return "충청남도 보령시"
        case .chungcheongnam_do_asan_si: return "충청남도 아산시"
        case .chungcheongnam_do_seosan_si: return "충청남도 서산시"
        case .chungcheongnam_do_nonsan_si: return "충청남도 논산시"
        case .chungcheongnam_do_gyeryong_si: return "충청남도 계룡시"
        case .chungcheongnam_do_dangjin_si: return "충청남도 당진시"
        case .chungcheongnam_do_geumsan_gun: return "충청남도 금산군"
        case .chungcheongnam_do_buyeo_gun: return "충청남도 부여군"
        case .chungcheongnam_do_seocheon_gun: return "충청남도 서천군"
        case .chungcheongnam_do_cheongyang_gun: return "충청남도 청양군"
        case .chungcheongnam_do_hongseong_gun: return "충청남도 홍성군"
        case .chungcheongnam_do_yesan_gun: return "충청남도 예산군"
        case .chungcheongnam_do_taean_gun: return "충청남도 태안군"
        case .jeollanam_do_mokpo_si: return "전라남도 목포시"
        case .jeollanam_do_yeosu_si: return "전라남도 여수시"
        case .jeollanam_do_suncheon_si: return "전라남도 순천시"
        case .jeollanam_do_naju_si: return "전라남도 나주시"
        case .jeollanam_do_gwangyang_si: return "전라남도 광양시"
        case .jeollanam_do_damyang_gun: return "전라남도 담양군"
        case .jeollanam_do_gokseong_gun: return "전라남도 곡성군"
        case .jeollanam_do_gurye_gun: return "전라남도 구례군"
        case .jeollanam_do_goheung_gun: return "전라남도 고흥군"
        case .jeollanam_do_boseong_gun: return "전라남도 보성군"
        case .jeollanam_do_hwasun_gun: return "전라남도 화순군"
        case .jeollanam_do_jangheung_gun: return "전라남도 장흥군"
        case .jeollanam_do_gangjin_gun: return "전라남도 강진군"
        case .jeollanam_do_haenam_gun: return "전라남도 해남군"
        case .jeollanam_do_yeongam_gun: return "전라남도 영암군"
        case .jeollanam_do_muan_gun: return "전라남도 무안군"
        case .jeollanam_do_hampyeong_gun: return "전라남도 함평군"
        case .jeollanam_do_yeonggwang_gun: return "전라남도 영광군"
        case .jeollanam_do_jangseong_gun: return "전라남도 장성군"
        case .jeollanam_do_wando_gun: return "전라남도 완도군"
        case .jeollanam_do_jindo_gun: return "전라남도 진도군"
        case .jeollanam_do_sinan_gun: return "전라남도 신안군"
        case .gyeongsangbuk_do_pohang_si_nam_gu: return "경상북도 포항시 남구"
        case .gyeongsangbuk_do_pohang_si_buk_gu: return "경상북도 포항시 북구"
        case .gyeongsangbuk_do_gyeongju_si: return "경상북도 경주시"
        case .gyeongsangbuk_do_gimcheon_si: return "경상북도 김천시"
        case .gyeongsangbuk_do_andong_si: return "경상북도 안동시"
        case .gyeongsangbuk_do_gumi_si: return "경상북도 구미시"
        case .gyeongsangbuk_do_yeongju_si: return "경상북도 영주시"
        case .gyeongsangbuk_do_yeongcheon_si: return "경상북도 영천시"
        case .gyeongsangbuk_do_sangju_si: return "경상북도 상주시"
        case .gyeongsangbuk_do_mungyeong_si: return "경상북도 문경시"
        case .gyeongsangbuk_do_gyeongsan_si: return "경상북도 경산시"
        case .gyeongsangbuk_do_uiseong_gun: return "경상북도 의성군"
        case .gyeongsangbuk_do_cheongsong_gun: return "경상북도 청송군"
        case .gyeongsangbuk_do_yeongyang_gun: return "경상북도 영양군"
        case .gyeongsangbuk_do_yeongdeok_gun: return "경상북도 영덕군"
        case .gyeongsangbuk_do_cheongdo_gun: return "경상북도 청도군"
        case .gyeongsangbuk_do_goryeong_gun: return "경상북도 고령군"
        case .gyeongsangbuk_do_seongju_gun: return "경상북도 성주군"
        case .gyeongsangbuk_do_chilgok_gun: return "경상북도 칠곡군"
        case .gyeongsangbuk_do_yecheon_gun: return "경상북도 예천군"
        case .gyeongsangbuk_do_bonghwa_gun: return "경상북도 봉화군"
        case .gyeongsangbuk_do_uljin_gun: return "경상북도 울진군"
        case .gyeongsangbuk_do_ulleung_gun: return "경상북도 울릉군"
        case .gyeongsangnam_do_changwon_si_uichang_gu: return "경상남도 창원시 의창구"
        case .gyeongsangnam_do_changwon_si_seongsan_gu: return "경상남도 창원시 성산구"
        case .gyeongsangnam_do_changwon_si_masanhappo_gu: return "경상남도 창원시 마산합포구"
        case .gyeongsangnam_do_changwon_si_masanhoewon_gu: return "경상남도 창원시 마산회원구"
        case .gyeongsangnam_do_changwon_si_jinhae_gu: return "경상남도 창원시 진해구"
        case .gyeongsangnam_do_jinju_si: return "경상남도 진주시"
        case .gyeongsangnam_do_tongyeong_si: return "경상남도 통영시"
        case .gyeongsangnam_do_sacheon_si: return "경상남도 사천시"
        case .gyeongsangnam_do_gimhae_si: return "경상남도 김해시"
        case .gyeongsangnam_do_miryang_si: return "경상남도 밀양시"
        case .gyeongsangnam_do_geoje_si: return "경상남도 거제시"
        case .gyeongsangnam_do_yangsan_si: return "경상남도 양산시"
        case .gyeongsangnam_do_uiryeong_gun: return "경상남도 의령군"
        case .gyeongsangnam_do_haman_gun: return "경상남도 함안군"
        case .gyeongsangnam_do_changnyeong_gun: return "경상남도 창녕군"
        case .gyeongsangnam_do_goseong_gun: return "경상남도 고성군"
        case .gyeongsangnam_do_namhae_gun: return "경상남도 남해군"
        case .gyeongsangnam_do_hadong_gun: return "경상남도 하동군"
        case .gyeongsangnam_do_sancheong_gun: return "경상남도 산청군"
        case .gyeongsangnam_do_hamyang_gun: return "경상남도 함양군"
        case .gyeongsangnam_do_geochang_gun: return "경상남도 거창군"
        case .gyeongsangnam_do_hapcheon_gun: return "경상남도 합천군"
        case .jeju_do_jeju_si: return "제주특별자치도 제주시"
        case .jeju_do_seogwipo_si: return "제주특별자치도 서귀포시"
        case .gangwon_do_chuncheon_si: return "강원특별자치도 춘천시"
        case .gangwon_do_wonju_si: return "강원특별자치도 원주시"
        case .gangwon_do_gangneung_si: return "강원특별자치도 강릉시"
        case .gangwon_do_donghae_si: return "강원특별자치도 동해시"
        case .gangwon_do_taebaek_si: return "강원특별자치도 태백시"
        case .gangwon_do_sokcho_si: return "강원특별자치도 속초시"
        case .gangwon_do_samcheok_si: return "강원특별자치도 삼척시"
        case .gangwon_do_hongcheon_gun: return "강원특별자치도 홍천군"
        case .gangwon_do_hoengseong_gun: return "강원특별자치도 횡성군"
        case .gangwon_do_yeongwol_gun: return "강원특별자치도 영월군"
        case .gangwon_do_pyeongchang_gun: return "강원특별자치도 평창군"
        case .gangwon_do_jeongseon_gun: return "강원특별자치도 정선군"
        case .gangwon_do_cheorwon_gun: return "강원특별자치도 철원군"
        case .gangwon_do_hwacheon_gun: return "강원특별자치도 화천군"
        case .gangwon_do_yanggu_gun: return "강원특별자치도 양구군"
        case .gangwon_do_inje_gun: return "강원특별자치도 인제군"
        case .gangwon_do_goseong_gun: return "강원특별자치도 고성군"
        case .gangwon_do_yangyang_gun: return "강원특별자치도 양양군"
        case .jeonbuk_do_jeonju_si_wansan_gu: return "전북특별자치도 전주시 완산구"
        case .jeonbuk_do_jeonju_si_deokjin_gu: return "전북특별자치도 전주시 덕진구"
        case .jeonbuk_do_gunsan_si: return "전북특별자치도 군산시"
        case .jeonbuk_do_iksan_si: return "전북특별자치도 익산시"
        case .jeonbuk_do_jeongeup_si: return "전북특별자치도 정읍시"
        case .jeonbuk_do_namwon_si: return "전북특별자치도 남원시"
        case .jeonbuk_do_gimje_si: return "전북특별자치도 김제시"
        case .jeonbuk_do_wanju_gun: return "전북특별자치도 완주군"
        case .jeonbuk_do_jinan_gun: return "전북특별자치도 진안군"
        case .jeonbuk_do_muju_gun: return "전북특별자치도 무주군"
        case .jeonbuk_do_jangsu_gun: return "전북특별자치도 장수군"
        case .jeonbuk_do_imsil_gun: return "전북특별자치도 임실군"
        case .jeonbuk_do_sunchang_gun: return "전북특별자치도 순창군"
        case .jeonbuk_do_gochang_gun: return "전북특별자치도 고창군"
        case .jeonbuk_do_buan_gun: return "전북특별자치도 부안군"
        }
    }
}
