#include <iostream>
#include <string>
#include <curl/curl.h>

int main(int argc, char* argv[]) {
    if (argc < 4) {
        std::cerr << "Usage: MailSender.exe <to_email> <subject> <body>\n";
        return 1;
    }

    std::string to_email = argv[1];
    std::string subject = argv[2];
    std::string body = argv[3];

    // ⚠️ Replace with your Yahoo credentials
    const std::string username = "your_yahoo_address@yahoo.com";
    const std::string password = "your_yahoo_app_password";

    std::string payload =
        "To: " + to_email + "\r\n" +
        "From: " + username + "\r\n" +
        "Subject: " + subject + "\r\n" +
        "\r\n" + body + "\r\n";

    CURL* curl = curl_easy_init();
    if (!curl) {
        std::cerr << "Failed to init libcurl.\n";
        return 1;
    }

    struct curl_slist* recipients = nullptr;
    recipients = curl_slist_append(recipients, to_email.c_str());

    curl_easy_setopt(curl, CURLOPT_USERNAME, username.c_str());
    curl_easy_setopt(curl, CURLOPT_PASSWORD, password.c_str());
    curl_easy_setopt(curl, CURLOPT_URL, "smtp://smtp.mail.yahoo.com:587");
    curl_easy_setopt(curl, CURLOPT_USE_SSL, CURLUSESSL_ALL);
    curl_easy_setopt(curl, CURLOPT_MAIL_FROM, ("<" + username + ">").c_str());
    curl_easy_setopt(curl, CURLOPT_MAIL_RCPT, recipients);
    curl_easy_setopt(curl, CURLOPT_READFUNCTION, [](char* ptr, size_t size, size_t nmemb, void* userdata) -> size_t {
        std::string* payload = static_cast<std::string*>(userdata);
        size_t buffer_size = size * nmemb;
        if (payload->empty()) return 0;

        size_t copy_size = std::min(buffer_size, payload->size());
        memcpy(ptr, payload->c_str(), copy_size);
        payload->erase(0, copy_size);
        return copy_size;
    });
    curl_easy_setopt(curl, CURLOPT_READDATA, &payload);
    curl_easy_setopt(curl, CURLOPT_UPLOAD, 1L);

    CURLcode res = curl_easy_perform(curl);

    if (res != CURLE_OK) {
        std::cerr << "Email failed: " << curl_easy_strerror(res) << "\n";
    } else {
        std::cout << "Email sent successfully.\n";
    }

    curl_slist_free_all(recipients);
    curl_easy_cleanup(curl);
    return (res == CURLE_OK) ? 0 : 1;
}
