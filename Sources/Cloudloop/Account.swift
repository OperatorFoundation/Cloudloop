// Account.swift
// https://docs.cloudloop.com/reference#create-billing-group

import Foundation

public struct AccountCreateBillingGroupResult: Codable
{
	let billingGroup: CreateBillingGroup
}

public struct AccountGetBillingGroupsResult: Codable
{
	let billingGroup: [BillingGroups]
}

public struct AccountDeleteBillingGroupResult: Codable
{
	let result: Bool
}

public struct Account
{
    // https://docs.cloudloop.com/reference#create-billing-group
    public func CreateBillingGroup(token: String, name: String) -> AccountCreateBillingGroupResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Account/CreateBillingGroup") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "name", value: name)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(AccountCreateBillingGroupResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-billing-groups
    public func GetBillingGroups(token: String) -> AccountGetBillingGroupsResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Account/GetBillingGroups") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(AccountGetBillingGroupsResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#delete-billing-group
    public func DeleteBillingGroup(token: String, BillingGroup: String) -> AccountDeleteBillingGroupResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Account/DeleteBillingGroup") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "BillingGroup", value: BillingGroup)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(AccountDeleteBillingGroupResult.self, from: resultData) else {return nil}

        return result
    }
}