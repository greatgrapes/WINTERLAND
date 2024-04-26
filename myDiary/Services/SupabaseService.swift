//
//  SupabaseService.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/26/24.
//

import Foundation
import Supabase

class SupabaseService {
    
    static let shared = SupabaseService()
    var supabaseClient: SupabaseClient?
    
    private init() {
        // Supabase 클라이언트 초기화 예시
        supabaseClient = SupabaseClient(supabaseURL: URL(string: "https://xyzcompany.supabase.co")!, supabaseKey: "public-anon-key")
    }
    
}



