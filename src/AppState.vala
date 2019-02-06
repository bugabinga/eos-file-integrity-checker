public enum View {
    WELCOME,
    RECENTS,
    DOWNLOADS,
}
public struct AppState {
    View active_view;
    string selected_file;
}
