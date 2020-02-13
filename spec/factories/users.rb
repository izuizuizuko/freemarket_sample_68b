FactoryBot.define do

    factory :user do
        nickname              {"abe"}
        email                 {"kkk@gmail.com"}
        password              {"0000000"}
        family_name           {"おもち"}
        first_name            {"もちもち"}
        kana_family_name      {"オモチ"}
        kana_first_name       {"モチモチ"}
        birthday              {"1919-01-02"}
        telnumber             {"00000000"}
    end

end