Rails.application.configure do
  config.baukis = {
    staff: { host: "baukis.example.com", path: "" },
    admin: { host: "baukis.example.com", path: "admin" },
    customer: { host: "example.com", path: "mypage" }
  }
end
