module HomePage exposing (main)

-- IMPORTS
import Browser exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


class : String -> Attribute msg
class =
    Html.Attributes.class

-- ALIAS
{-
    Para este proyecto necesitamos:
    - Implementar un modelo, como es un portfolio necesitará los proyectos, y tratado de implementar también
      un formulario de registro asociado a esta página para la parte de contacto pero no he sido capaz.
    - Definir nuestros proyectos con sus respectivos campos
    - El usuario para el contacto.
    - Los mensajes para enviar los datos a la web

-}
type alias Model =
    { projects : List Project
    , newclient : Contact
    }

type alias Link =
    String


type alias Project =
    { name : String
    , description : String
    , link : Link
    , projectType : String
    }

type alias Contact =
    { name : String
    , email : String
    , note : String
    }


type Msg
    = NewProject Project
    | NewClient Contact


-- LISTA CON TODOS LOS PROYECTOS
listProjects : List Project
listProjects =
    [ Project "PokerPlays" "PokerPlays es un sistema de reconocimiento de cartas de Poker mediante OpenCV en Python." "https://github.com/luisglzn/PokerPlays" " - Reconocimiento de imágenes"
    , Project "ISSI-Friends" "ISSI-Friends es una aplicación web de una red social ficticia emulando el funcionamiento de Instagram." "https://github.com/luisglzn/ISSI-Friends" " - App Web"
    , Project "Sist. de Adquisición y Control" "Proyecto en el que se hace una máquina de estados en C." "https://github.com/luisglzn/SAC" " - Sistemas de Adquisición y Control"
    , Project "Sist. de Recomendación" "Ejercicio práctico en el que se desarrolla un sistema de recomendación en Django usando Python" "https://github.com/luisglzn/Sistemas-de-Recomendaci-n" " - Sistemas de Recomendación"
    , Project "WebScrapping" "Ejercicio práctico en el que se realiza WebScrapping sobre una pag.web de recetas usando BeautifulSoup en Python" "https://github.com/luisglzn/WebScrapping---Recetas" " - WebScrapping"
    , Project "Socket Seguros" "Projecto en el que se realiza la comunicación entre Cliente-Servidor mediante el cifrado de mensajes en Java" "https://github.com/luisglzn/Socket-Seguros" " - Comunicación Cliente-Servidor"
    ]


-- VISTA DE LA PAGINA WEB
{-
    En esta vista lo único que añadimos es un título para la ventana del navegador 
    y el body, que incluye toda la página web
-}
view : Model -> Browser.Document Msg
view model =
    { title = "DEMO ELM - LUIS.G"
    , body =  [ page model ]
    }

-- MAIN VIEW DE LA PÁGINA
page : Model -> Html Msg
page model =
    div [ class "container" ]
        [ 
         section [ class "header" ]
            [ div [ class "wrapper-inner" ]
                [ p []
                    [
                      br[][]
                    , text "Soy Luis González, estudiante de la  "
                    , strong [] [ text "Universidad de Sevilla," ]
                    , text <| 
                        """ 
                        del grado de 
                        """
                    , strong [] [text "Ingenieria Informática. Ingeniería de Computadores"]
                    ]
                    , br [] []
                    , text "Para esta Demo he pensado en realizar un Portfolio a modo de presentación en"
                    , a [ class "button button-primary", href "https://elmprogramming.com/" ] [ text " ELM" ]     
                ]
            ]
        , viewPortfolioSection -- Inclusión de las vistas anteriores definadas debajo para no hacer demasiado grande el código
        , aboutMe model
        , section [ style "marginBottom" "3rem" ]
            [ div [ class "wrapper-inner", style "textAlign" "center" ]
                [ label [ style "textTransform" "unset" ] [
                    text "Esta página es una DEMO muy sencilla en el que se implementa el uso de vistas,modelos , mensajes, suscripciones"
                    ,br[][]
                    ,text "En el projecto entregado también hay otras Páginas que no he sabido como linkear directamente. Son una página de un registro de un usuario"
                    ,br[][]
                    ,text "Recuros utilizados de la página oficial de "
                    , a [ href "https://elm-lang.org", target "_blank" ] [ text "Elm" ], text "." ]
                ]
            ]
        ]

-- MODELO DEL ACERCA DE MÍ
aboutMe : Model -> Html Msg
aboutMe model =
    section [ class "contact" ]
        [ div [ class "wrapper-inner" ]
            [ div [ class "contact" ]
                [ h2 [] [ text "CONTACTO 📞" ]
                , p [] 
                [ 
                    text "Para cualquier duda o contacto no duden en mandarme un mensaje a través de correo eléctronico o LinkedIn  " ]
                ,   strong [] [text "luisgonzalezlozano12@gmail.com" ]
                , br [] []
                ,   a [ class "button button-primary", href "https://www.linkedin.com/in/luis-gonz%C3%A1lez-lozano/" ] [ text "LinkedIn" ]
                , br [] []
                ,   a [ class "button button-primary", href "https://github.com/luisglzn" ] [ text "GitHub" ]
                ]
            ]
        ]

-- VISTA DEL PORTFOLIO

viewPortfolioSection : Html Msg
viewPortfolioSection =
    section [ class "projects" ]
        [ a [ id "portfolio" ] []
        , div [ class "projects" ]
            [ h1 [ style "alignItems" "center", style "display" "flex" ]
                [ strong [] [text "PROYECTOS REALIZADOS"] 
                ]
            , List.map viewPortfolioItem listProjects
                |> div [ class "grid" ]
            ]
        ]

-- ITEM CON EL TAG PARA EL ENLACE DEL PROYECTO
{-
    Si existe el enlace asociado a la página entonces redirige correctamente
    En caso contrario lo pondrá como vacio 
-}

viewPortfolioItem : Project -> Html msg
viewPortfolioItem { name, description, link, projectType } =
    let
        projectLink =
            isLink link

        isLink url =
            if url == "" then
                [ href "#" ]

            else
                [ href link, target "_blank" ]
    in
   
    div [ class "item" ]
        [ 
        h4 [] [ text name, small [ class "tag" ] [ text projectType ] ]
        , p []
            [ text description
            ]
        , a projectLink [ text "Enlace al proyecto »" ]
        ]


initialModel : Model
initialModel =
    { projects = []
    , newclient = Contact "" "" ""
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )

-- UPDATE
{-
    En el Update he intentado hacer una implementación de mensajes para añadir
    nuevo usuarios pensando en el signup y nuevos proyectos pero no se he logrado realizarlo correctamente.
    Los he mantenido en el código únicamente para que el resto de código no deje de funcionar.
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewProject project ->
            ( { model | projects = model.projects ++ [] }, Cmd.none )

        NewClient client ->
            ( { model | newclient = Contact "test" "test" "tester" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
    
-- MAIN DEL PROGRAMA
main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
