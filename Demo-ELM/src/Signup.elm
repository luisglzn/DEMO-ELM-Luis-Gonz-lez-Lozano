module Signup exposing (main,view)

-- IMPORTS
import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick, onInput)
import VirtualDom


-- MODELO DEL USUARIO
type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }

type alias Model = Int

initialModel : User
initialModel = 
    { name = "Nombre de usuario"
    , email = "Correo Electrónico"
    , password = "Contraseña"
    , loggedIn = False
    }

-- VIEW

{-
    Creo una vista con todos los campos de nuestro formulario de registro asignadole
    el tipo adecuado a cada uno guardando los inputs del usuario.
-}

view : User -> Html Msg 
view user = 
    div [class "form"]
    [ div [class "row"]
        [
            h1[css [paddingLeft (cm 3)]] [text "Registrate"]
        ,   styledForm []
            [ div []
                [ 
                    text "Nombre"
                ,   styledInput [id "name", type_ "text",  onInput SaveName][] -- Llamamos al evento update para guardar el nombre de usuario
                ]
            , div []
                [
                    text "Email"
                ,   styledInput [id "email" , type_ "email", onInput SaveEmail] []  -- Llamamos al evento update para guardar el correo
                ]
            , div []
                [
                    text "Contraseña"
                ,   styledInput [id "password" , type_ "password", onInput SavePassword] [] -- Llamamos al evento update para guardar la contraseña
                    
                ]
            , div []
                [
                    styledButton [type_ "submit", onClick Signup]
                    [text "Crear mi cuenta"]
                ]
            ]
        ]
    ]

-- MENSAJES DEL FORMULARIO
{-
    Necesitaremos guardar los input del formulario para guardarlos después en una base de datos
-}

type Msg = 
    SaveName String
    | SaveEmail String
    | SavePassword String
    | Signup

-- Creamos los mensajes de guardado
update : Msg -> User -> User
update message user = 
    case message of
        SaveName name -> {user | name = name}
        SaveEmail email -> {user | email = email}
        SavePassword password -> {user | password = password}
        Signup -> {user | loggedIn = True}

-- CSS
{-
    Para este formulario de registro he utilizado dos opciones para el CSS:
    - Implementar directamente el CSS en el código haciendo uso del modulo de CSS de ELM.
    - Asociar un CSS a un fichero HTML del JavaScript del formulario de registro.

    Es algo redundante hacer los dos, en un proyecto normal elegiría entre una de las dos opciones pero quería
    implementar ambas para ver como se puede ver un archivo .elm con CSS cuando lo abrimos en localhost (elm reactor)
    y también hacer un archivo html normal final donde se pueda ver el mismo estilo.
-}
styledForm : List (Attribute msg) -> List (Html msg) -> Html msg
styledForm =
    styled Html.Styled.form
        [ borderRadius (px 5)
        , backgroundColor (hex "#f2f2f2")
        , padding (px 20)
        , Css.width (px 300)
        ]


styledInput : List (Attribute msg) -> List (Html msg) -> Html msg
styledInput =
    styled Html.Styled.input
        [ display block
        , Css.width (px 260)
        , padding2 (px 12) (px 20)
        , margin2 (px 8) (px 0)
        , border (px 0)
        , borderRadius (px 4)
        ]


styledButton : List (Attribute msg) -> List (Html msg) -> Html msg
styledButton =
    styled Html.Styled.button
        [ Css.width (px 300)
        , backgroundColor (hex "#397cd5")
        , color (hex "#fff")
        , padding2 (px 14) (px 20)
        , marginTop (px 10)
        , border (px 0)
        , borderRadius (px 4)
        , fontSize (px 16)
        ]


-- MAIN
main : Program () User Msg
main = 
    Browser.sandbox
    {
        init = initialModel
    ,   view = view >> toUnstyled -- El >> lo incluyo para que la vista con el estilo CSS en código prevalezca sobre la normal.
    ,   update = update
    }